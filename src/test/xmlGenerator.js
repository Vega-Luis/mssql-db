const fs = require("fs").promises;

async function main() {
    await fs.writeFile("data.xml",`<Users>\n` , {
        flag : "a"
     });
    for (let step = 0; step <10; step++) {
       let userName = Math.random().toString(36).substring(2,(Math.random()* (16 - 6) + 6));
       let password = Math.random().toString(36).substring(2,(Math.random()* (16 - 6) + 6) );

       await fs.writeFile("data.xml",`\t<User UserName="${userName}" Password="${password}"/>\n` , {
           flag : "a"
        });
    }
    await fs.writeFile("data.xml",`</Users>\n` , {
        flag : "a"
     });

    await fs.writeFile("data.xml",`<Articles>\n` , {
        flag : "a"
     });
    for (let step = 0; step <10; step++) {
        let Name = Math.random().toString(36).substring(2,(Math.random()* (16 - 6) + 6));
        await fs.writeFile("data.xml",`\t<Article Name="${Name}" Price="${(Math.random()* (500000 - 0) )}"/>\n` , {
            flag : "a"
         });
     }
     await fs.writeFile("data.xml",`</Articles>\n` , {
        flag : "a"
     });
}

main();