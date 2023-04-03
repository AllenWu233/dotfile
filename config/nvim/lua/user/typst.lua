local status_ok, typstplgi=pcall(require,"typst")
if not status_ok then
  return
end

typstplgi.setup{}

