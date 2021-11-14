import { Elm } from '../elm/Main.elm'

// Initialize your flags here, if you have them.
var flags = undefined;

var app = Elm.Main.init({
    node: document.querySelector('main'),
    flags: flags
});
