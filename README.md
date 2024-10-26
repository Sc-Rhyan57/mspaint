# mspaint Fã Edition
> [!IMPORTANTE]
> Esse script foi **cancelado** e não é o oficial, eu apenas peguei essa versão para mim por que o Upio simplesmente abandonou ela, então agora é minha. 😉👍
> Um hub de script decente, gratuito e de código aberto 🥶

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Sc-Rhyan57/mspaint/refs/heads/main/main.lua"))()
```

**Links**:
- [🌐 Website](https://mspaint.upio.dev/)
- [💬 Discord](https://discord.com/invite/cfyMptntHr)

# Addons
Você pode encontrar documentação sobre como criar um complemento aqui: https://docs.upio.dev/mspaint/addons/getting_startedVocê 
# Website
our website is at https://mspaint.upio.dev (source code here at https://github.com/notpoiu/webmspaint)


> [!IMPORTANT]
> This script now uses the [wax bundler](https://github.com/latte-soft/wax) to organize code

## Bundling mspaint via wax
To bundle all the scripts, you have to follow these steps:

1. Install [rokit](https://github.com/rojo-rbx/rokit) if you haven't already
2. Open Powershell or the command-line shell of your liking and [cd to this repository](https://www.quora.com/What-does-it-mean-to-CD-into-a-directory-and-how-can-I-do-that-Can-someone-explain-it-in-a-laymans-term)
3. Run `rokit install` and wait for it to install all the dependencies
4. Run `lune run Build bundle input='default.project.json' minify=false output='Distribution/Script.luau' env-name="Script" darklua-config-path="Build/DarkLua.json" temp-dir-base="Distribution" verbose=true`

You can find the bundled script in `/Distribution/Script.luau`.
