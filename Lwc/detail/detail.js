import { LightningElement, api } from 'lwc';
import { movies } from 'c/data';


export default class Detail extends LightningElement {

    // Ensure changes are reactive when product is updated
    product;

    // Private var to track @api productId
    _producttitle = undefined;

    // Use set and get to process the value every time it's
    // requested while switching between products
    set producttitle(value) {
        this._producttitle = value;
        this.product = movies.find(movie => movie.display_title === value);
    }
    
    // getter for productId
    @api get producttitle(){
        return this._producttitle;
    }
}