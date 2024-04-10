import json,jsonpath
#
# ext = [('pid', '6632'), ('ext', '{"mv":10,"netE":{"rt":-1,"ipx":4}}')]
#
# # map = {}
# # for i in ext:
# #     key = i[0]
# #     value = i[1]
# #     if key == "ext":
# #         value = json.loads(i[1])  # 把字典中的str转换成字典
# #     map[key] = value
# # print(map)
# # host_values = jsonpath.jsonpath(map,'$..rt')
# # print(host_values)
#
#
b = [('pid', '6632'), ('ext', '{"ret":[{"package":"com.keruyun","userID":1000}],"mv":1001}')]
map = {}
for i in b:
    key = i[0]
    value = i[1]
    if key == "ext":
        value = json.loads(i[1])  # 把字典中的str转换成字典

    map[key] = value
print(map)
host_values = jsonpath.jsonpath(map,'$..package')[0]
print(host_values)
check = ["package","userID","mv"]
for i in check:
    all_values = jsonpath.jsonpath(map, f'$..{i}')[0]
    print(all_values)


