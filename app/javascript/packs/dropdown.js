// This is how you write javascript in erb. Better not to. But you can.
function showIngredients(category) {
  // element = is the argument which is the a link
  // parentElement = is the parent element of the a href which is the div
  // classList = you are getting access to the class of ul
  // toggle = if hidden exsits then delete it. If it doesnt exsit then add it
  // We have it so it will delete it
  document.querySelector(`ul.ingredients-${category}`).classList.toggle("collapsed")
  document.querySelector(`ul.ingredients-${category}`).classList.toggle("padding-fix")
  // element.parentElement.querySelector("ul.ingredients").classList.toggle("collapsed")
}

  function rotateArrow(r) {
    const arrow = document.querySelector(`.arrow-dropdown-${r}`);
    arrow.classList.toggle("arrow-dropdown-down")
    // arrow.style.transform = "rotate(90deg)";
  }
  // arrow.addEventListener('click', rotateArrow());

