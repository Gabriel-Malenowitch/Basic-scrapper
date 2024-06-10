defmodule BasicScrapper.NewsScrapper do
  defp base_url(), do: "https://g1.globo.com/?utm_source=globo.com&utm_medium=header"

  defp parse_item(response) do
    html = response.body

    {:ok, parsed} = Floki.parse_document(html)

    parsed
      |> Floki.find(".bastian-feed-item")
      |> Enum.map(fn element ->
          %{
            header: Floki.find(element, ".feed-post-header") |> Floki.text(),
            body_title: Floki.find(element, ".feed-post-body-title") |> Floki.text(),
            link: Floki.find(element, ".feed-post-body-title") |> Floki.find("a") |> Floki.attribute("href") |> Floki.text(),
            description: Floki.find(element, ".feed-post-body-resumo") |> Floki.text(),
            image: Floki.find(element, ".bstn-fd-picture-image") |> Floki.attribute("src") |> Floki.text()
          }
      end)
  end

  def get_list() do
    with response <- Crawly.fetch(base_url()) do
      parse_item(response)
    end
  end
end
