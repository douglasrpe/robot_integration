*** Variables ***
# MenuBar with cascate example
${menubar}                          //helix-core-menu
${menubar_item}                     ${menubar} >> helix-core-menu-item
${menubar_item_products}            ${menubar_item} > helix-core-button[href="/products"]
${menubar_item_order}               ${menubar_item} > helix-core-button[href="/order"]
${menubar_item_explore_content}     ${menubar_item} > helix-core-button[href="/explore-content"]
# MenuBar Elements relative selector match
${menubar_products}                 helix-core-button[href="/products"]
${menubar_order}                    helix-core-button[href="/order"]
${menubar_order_materials}          helix-core-button[href="/materials"]

# Home Page
${explore_content_container}        //helix-core-band[2]
${videos_page_button}               ${explore_content_container} >> helix-core-button[href='/videos'] a.button

# Products Page
${product_list}                     //extras-product-listing
${product_list_letterB}             ${product_list} >> extras-letter-container:nth-child(1)
#${product_list_letterB}    extras-letter-container:nth-child(1)
${product_list_firstB}              ${product_list_letterB} extras-product:nth-child(1)
${product_list_firstB_HCPSite}      ${product_list_firstB} >> text="HCP Site"
#${product_list_firstB_HCPSite}    a[class='extras-product-link__anchor']:first-child

# Explore Content Page
${container_picker}                 extras-menu-picker
${explore_select_therapy_area}      ${container_picker} helix-core-grid-item:nth-child(1) > helix-dropdown
${items_therapy_area}               ${explore_select_therapy_area} .dropdown__list-items
${explore_select_product}           ${container_picker} helix-core-grid-item:nth-child(2) > helix-dropdown
${explore_go_button}                ${container_picker} button:nth-child(1)

# Medical Page
${pfizer_medical_link}              helix-core-button[href='/pfizer-medical']

# Footer
${footer_patient_link}              //u[contains(text(),"Patient Assistance Programs")]
${footer_terms_of_use}              //u[contains(text(),"Terms of Use")]
