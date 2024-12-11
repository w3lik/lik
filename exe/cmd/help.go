package cmd

import (
	"fmt"
)

func Help() {
	fmt.Println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
	fmt.Println("┃ - 新建一个项目")
	fmt.Println("┃     lik.exe new [项目名]")
	fmt.Println("┃")
	fmt.Println("┃ - 打开WE编辑地形")
	fmt.Println("┃     lik.exe we [项目名]")
	fmt.Println("┃     lik.exe we (若不带项目名则独自打开编辑器)")
	fmt.Println("┃")
	fmt.Println("┃ - 打开WE批量模型")
	fmt.Println("┃     lik.exe -a (全部模型)")
	fmt.Println("┃     lik.exe -a [搜索名] (指定包含某搜索名模型)")
	fmt.Println("┃     lik.exe -a [搜索名,搜索名] (指定同时包含多搜索名模型)")
	fmt.Println("┃     lik.exe -n (指定目录为assetsNew的全部模型)")
	fmt.Println("┃     lik.exe -p:[项目名] (指定项目内全部模型)")
	fmt.Println("┃")
	fmt.Println("┃ - 测试项目")
	fmt.Println("┃     lik.exe run [项目名] (默认热更新)")
	fmt.Println("┃     lik.exe run [项目名] -h (热更新模式)")
	fmt.Println("┃     lik.exe run [项目名] -t (内调试模式)")
	fmt.Println("┃     lik.exe run [项目名] -b (预构建模式)")
	fmt.Println("┃     lik.exe run [项目名] -d (预发行模式)")
	fmt.Println("┃     lik.exe run [项目名] -r (外发布模式)")
	fmt.Println("┃     lik.exe run [项目名] -h~ (各模式后加~号表示引用temp缓存打包开启测试)")
	fmt.Println("┃     lik.exe run [项目名] -h! (各模式后加!号表示只打包不开启测试)")
	fmt.Println("┃")
	fmt.Println("┃ - 清理缓存")
	fmt.Println("┃     lik.exe clear")
	fmt.Println("┃")
	fmt.Println("┃ - 打开多个魔兽客户端")
	fmt.Println("┃     lik.exe multi [数量]")
	fmt.Println("┃")
	fmt.Println("┃ - 关闭所有魔兽客户端")
	fmt.Println("┃     lik.exe kill")
	fmt.Println("┃")
	fmt.Println("┃ @官方网站 https://www.hunzsig.com")
	fmt.Println("┃ @发电作者 https://afdian.com/a/hunzsig")
	fmt.Println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
}
