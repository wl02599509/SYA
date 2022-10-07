// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {  
  show(){
    const theSection = document.querySelector('#link-info-section');

    const createdAt= this.element.dataset.createdAt;
    const userEmail = this.element.dataset.userEmail;
    const shortenedUrl = this.element.dataset.shortened_url;
    const url = this.element.dataset.url;
    const clicked = this.element.dataset.clicked;

    const newDiv = document.createElement('div');
    const childDiv = document.createElement('div');
    newDiv.className = "bg-pink-100 my-5 p-5";
    newDiv.id = "show-first-layer";

    const createAtDiv = document.createElement('div');
    createAtDiv.className = "py-3";

    const shortenedUrlDiv = document.createElement('div');
    const shortenedUrlHref = document.createElement('a');
    shortenedUrlDiv.append(shortenedUrlHref)
    shortenedUrlDiv.className = "my-6";
    shortenedUrlHref.setAttribute('href', shortenedUrl);
    shortenedUrlHref.className = "py-3 hover:bg-blue-100 py-3";

    const urlDiv = document.createElement('div');
    const urlHref = document.createElement('a');
    urlDiv.append(urlHref)
    urlDiv.className = "my-6";
    urlHref.setAttribute('href', url);
    urlHref.className = "py-3 hover:bg-blue-100 py-3";

    const clickedDiv = document.createElement('div');
    clickedDiv.className = "py-3";

    const createAtContent = document.createTextNode(createdAt + " By " + userEmail);
    const shortenUrlContent = document.createTextNode(shortenedUrl)
    const urlContent = document.createTextNode("Destination: " + url);
    const clickedContent = document.createTextNode("Clicked: " + clicked);

    createAtDiv.appendChild(createAtContent);
    shortenedUrlHref.appendChild(shortenUrlContent);
    urlHref.appendChild(urlContent);
    clickedDiv.appendChild(clickedContent);

    newDiv.appendChild(childDiv);
    childDiv.append(createAtDiv);
    childDiv.append(shortenedUrlDiv);
    childDiv.append(urlDiv);
    childDiv.append(clickedDiv);

    const justNewDive = document.querySelector("#show-first-layer");

    theSection.childNodes.forEach(function(elm){
      if (elm === justNewDive) {
        justNewDive.remove();
      }
    })
    theSection.insertAdjacentElement("beforeend", newDiv);
  }
}
