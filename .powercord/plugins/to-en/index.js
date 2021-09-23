const { Plugin } = require(`powercord/entities`)
const { get } = require(`powercord/http`)


module.exports = class toPt extends Plugin {
    constructor(){
        super();
        
    }
    startPlugin(){
        powercord.api.commands.registerCommand({
            command: `toen`,
            description: `traduz texto para ingles`,
            usage: `<texto>`,
            executor: async(args) => {
                const res = await this.translate(args.join(' '))
                return {
                    send: false,
                    result: `\`\`\`\n${res[0][0][0]}\n\`\`\``
                }
            } 
        })
    }
    translate = async(text) => {
        let url = `http://translate.googleapis.com/translate_a/single?client=gtx&sl=pt&tl=en&dt=t&q=${text}&ie=UTF-8&oe=UTF-8`
        const res = await get(url);
        return res.body;
    } 
    pluginWillUnload(){
        powercord.api.commands.unregisterCommand(`toen`);
    }
    
}