alias RbApp.{Repo, Website}

# site_params = [
#   %{
#     url: "https://www.test-site.com",
#     website_title: "Breanna's Website",
#     api_key: "03545130-2cd7-40d7-bb11-fea060250890"
#   },
#   %{
#     url: "https://www.test.com",
#     website_title: "Robert's Website",
#     api_key: "03545130-2cd7-40d7-bb11-bca191250970"
#   }
# ]

# _websites =
#   site_params
#   |> Enum.map(fn params ->
#     %Website{} |> Website.changeset(params) |> Repo.insert!()
#   end)
