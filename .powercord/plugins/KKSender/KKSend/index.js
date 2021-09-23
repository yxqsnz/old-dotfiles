const { Plugin } = require(`powercord/entities`)
const KKURL = "https://chart.apis.google.com/chart?cht=tx&chco=ffffff&chf=bg,s,36393f&chl=%5Ctext%7BKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK";
const getURL = (content) => `https://chart.apis.google.com/chart?cht=tx&chco=ffffff&chf=bg,s,36393f&chl=%5Ctext%7B${encodeURI(content)}`;

module.exports = class Sender extends Plugin {
  constructor() {
    super();

  }
  startPlugin() {
    powercord.api.commands.registerCommand({
      command: `kkk`,
      description: `kkkkk`,
      usage: ``,
      executor: _ => {
        return {
          send: true,
          result: KKURL
        }
      }
    })
    powercord.api.commands.registerCommand({
      command: `send`,
      description: `manda um texto`,
      usage: `<texto>`,
      executor: args => {
        return {
          send: true,
          result: getURL(args.join(' '))
        }
      }
    })
  }

  pluginWillUnload() {
    powercord.api.commands.unregisterCommand(`send`);
    powercord.api.commands.unregisterCommand(`kkk`);

  }

}