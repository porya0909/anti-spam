local function run(msg, matches)
  local data = load_data(_config.moderation.data)
  if matches[1] == "sethelp" and matches[2] and is_admin1(msg) then
  data['help_text'] = matches[2]
    save_data(_config.moderation.data, data)
  return "متن راهنما ذخیره شد"
end

if matches[1] == "clearhelp" and is_admin1(msg) then
 data['help_text'] = nil
  return "متن راهنما پاک شد"
end

if matches[1] == "help" and msg.to.type == "channel" then
 if data['help_text'] then
 local help_text = data['help_text']
   return "راهنمای سوپر گروه  :\n"..help_text
 else 
  return "موجود نیست \nبا دستور زیر ست کنید\n/sethelp <text>"
     end
  end
end

return {
description = "Best Help Plugin",
usage = {
    "/sethelp <help_text> : Set Text Help",
    "/clearhelp : Clean The Last Help Text",
    "/help : Get Help Text"
},
    patterns = {
        "^[/#](sethelp) (.*)$",
        "^[/#](clearhelp)$",
        "^[#/](help)$"
    },
    run = run
}
