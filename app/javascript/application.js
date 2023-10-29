// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import '@material/web/all'
import '@shoelace-style/shoelace/dist/shoelace.js'
import {registerIconLibrary} from "@shoelace-style/shoelace";

registerIconLibrary('material', {
    resolver: name => {
        const match = name.match(/^(.*?)(_(round|sharp))?$/);
        return `https://cdn.jsdelivr.net/npm/@material-icons/svg@1.0.5/svg/${match[1]}/${match[3] || 'outline'}.svg`;
    },
    mutator: svg => svg.setAttribute('fill', 'currentColor')
});