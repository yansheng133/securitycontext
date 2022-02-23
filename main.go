package main

import (
	"os/exec"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/ping/:exec", func(c *gin.Context) {
		exe := c.Params.ByName("exec")
		out, err := exec.Command(exe).Output()
		if err != nil {
			c.JSON(200, gin.H{
				"message": err,
			})
		}
		output := string(out[:])
		c.JSON(200, gin.H{
			"CLI return message": output,
			"Warning: ":          "This is training sample, DO NOT USE IT FOR BAD!",
		})
	})
	r.Run()
}
