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
    const url = this.element.dataset.url;
    const clicked = this.element.dataset.clicked;

    const newDiv = document.createElement('div');
    const childDiv = document.createElement('div');
    newDiv.className = "bg-pink-100 my-5 p-5";
    newDiv.id = "show-first-layer"

    const createAtDiv = document.createElement('div');
    createAtDiv.className = "py-3";
    const urlDiv = document.createElement('div');
    urlDiv.className = "py-3";
    const clickedDiv = document.createElement('div');
    clickedDiv.className = "py-3";

    const createAtContent = document.createTextNode(createdAt + " by " + userEmail);
    const urlContent = document.createTextNode(url);
    const clickedContent = document.createTextNode(clicked);

    createAtDiv.appendChild(createAtContent);
    urlDiv.appendChild(urlContent);
    clickedDiv.appendChild(clickedContent);

    newDiv.appendChild(childDiv);
    childDiv.append(createAtDiv);
    childDiv.append(urlDiv);
    childDiv.append(clickedDiv);

    const justNewDive = document.querySelector("#show-first-layer")

    theSection.childNodes.forEach(function(elm){
      if (elm === justNewDive) {
        justNewDive.remove()
      }
    })
    theSection.insertAdjacentElement("beforeend", newDiv);
  }
}
