local function run(msg, matches)
    if matches[1] == "del" and is_sudo(msg) then
text = io.popen("cd plugins && rm -rf "..matches[2])
return text.."پلاگین ["..matches[2].."] با موفقیت حذف شد"
end 
end

return { 
patterns = {
 
'^[!/](del) (.*)$' 
},
run = run,
}