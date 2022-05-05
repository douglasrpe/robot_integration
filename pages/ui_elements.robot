*** Variables ***
# MenuBar with cascate example
${menubar}                          //helix-core-menu
${menubar_item}                     ${menubar} >> helix-core-menu-item
${menubar_item_products}            ${menubar_item} > helix-core-button[href="/products"]
${menubar_item_order}               ${menubar_item} > helix-core-button[href="/order"]
# MenuBar Elements relative selector match
${menubar_products}                 helix-core-button[href="/products"]
${menubar_order}                    helix-core-button[href="/order"]
${menubar_order_materials}          helix-core-button[href="/materials"]

# Products Page
${product_list}                     //extras-product-listing
${product_list_letterB}             ${product_list} >> extras-letter-container:nth-child(1)
#${product_list_letterB}    extras-letter-container:nth-child(1)
${product_list_firstB}              ${product_list_letterB} extras-product:nth-child(1)
${product_list_firstB_HCPSite}      ${product_list_firstB} >> text="HCP Site"
#${product_list_firstB_HCPSite}    a[class='extras-product-link__anchor']:first-child

# Order Materials Page
${materials_picker}                 extras-menu-picker
${materials_select_therapy_area}    ${materials_picker} helix-core-grid-item:nth-child(1) > helix-dropdown
${items_therapy_area}               ${materials_select_therapy_area} .dropdown__list-items
${materials_select_product}         ${materials_picker} helix-core-grid-item:nth-child(2) > helix-dropdown
${materials_go_button}              ${materials_picker} button:nth-child(1)
