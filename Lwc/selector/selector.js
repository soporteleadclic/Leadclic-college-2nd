import { LightningElement } from 'lwc';

export default class Selector extends LightningElement {
    selectedProductTitle;

    handleProductSelected(evt) {
        this.selectedProductTitle = evt.detail;
    }
}
