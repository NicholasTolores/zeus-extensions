function Search(query)
    local url = "https://zeustranslations.blogspot.com/search?q=" .. query
    local doc = Html:DownloadDocument(url)
    local elements = doc:select("h3.post-title > a")
    local results = {}

    for i=0, elements:size()-1 do
        local el = elements:get(i)
        local title = el:text()
        local link = el:attr("href")
        results[#results+1] = {
            name = title,
            url = link,
            host = "zeustranslations"
        }
    end

    return results
end

function Chapters(url)
    local doc = Html:DownloadDocument(url)
    local elements = doc:select("div.entry-content a")
    local chapters = {}

    for i=0, elements:size()-1 do
        local el = elements:get(i)
        local title = el:text()
        local link = el:attr("href")
        chapters[#chapters+1] = {
            name = title,
            url = link,
            host = "zeustranslations"
        }
    end

    return chapters
end

function Content(url)
    local doc = Html:DownloadDocument(url)
    local content = doc:select("div.entry-content"):text()
    return content
end
