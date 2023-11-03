
document.addEventListener("turbo:load", function() {
  // attrName = "taste or area"
  const buildForm = (attrName, index) => {
    // let html =""
    let newForm
    if (attrName == "taste"){
      // html = `<input data-index="${index}" type="text" name="item[tastes_attributes][${index}][taste]" id="item_tastes_attributes_${index}_taste">`
      newForm = document.createElement("input")
      newForm.dataset.index = index
      newForm.type = "text"
      newForm.name = `item[tastes_attributes][${index}][taste]`
      newForm.id=`item_tastes_attributes_${index}_taste`
      newForm.classList.add("taste_form")
    }else{
      // html = `<input data-index="${index}" type="text" name="item[areas_attributes][${index}][area]" id="item_areas_attributes_${index}_area">`
      newForm = document.createElement("input")
      newForm.dataset.index = index
      newForm.type = "text"
      newForm.name = `item[areas_attributes][${index}][area]`
      newForm.id=`item_areas_attributes_${index}_area`
      newForm.classList.add("area_form")
    }
    return newForm
  }
  
  let addTasteBtn = document.getElementById("add_taste")
  let reduceTasteBtn = document.getElementById("reduce_taste")
  let addAreaBtn = document.getElementById("add_area")
  let reduceAreaBtn = document.getElementById("reduce_area")


  addTasteBtn.addEventListener("click", () => {
    let tasteForms = document.querySelectorAll("#taste_form_container > .taste_form")
    console.log(tasteForms)
    let lastIndex = -1
    if (tasteForms.length > 0){
      lastIndex = parseInt(tasteForms[tasteForms.length - 1].dataset.index)
    }
    let newForm = buildForm("taste", parseInt(lastIndex)+1)
    document.getElementById("taste_form_container").append(newForm)
  })

  reduceTasteBtn.addEventListener("click", () => {
    let tasteForms = document.querySelectorAll("#taste_form_container > .taste_form")
    if(tasteForms.length <= 0){
      return
    }
    tasteForms[tasteForms.length-1].remove()
  })

  addAreaBtn.addEventListener("click", () => {
    let areaForms = document.querySelectorAll("#area_form_container > .area_form")
    let lastIndex = -1
    if (areaForms.length > 0){
      lastIndex = parseInt(areaForms[areaForms.length - 1].dataset.index)
    }
    let newForm = buildForm("area", parseInt(lastIndex)+1)
    document.getElementById("area_form_container").append(newForm)
  })

  reduceAreaBtn.addEventListener("click", () => {
    let areaForms = document.querySelectorAll("#area_form_container > .area_form")
    if(areaForms.length <= 0){
      return
    }
    areaForms[areaForms.length-1].remove()
  })
});