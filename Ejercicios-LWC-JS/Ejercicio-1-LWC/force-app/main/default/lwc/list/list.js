import { LightningElement } from 'lwc';
import { books } from 'c/data';

export default class List extends LightningElement {
    books = books;

    handleTileClick(evt) {
        // This component wants to emit a productselected event to its parent
        const event = new CustomEvent('productselected', {
            detail: evt.detail
        });
        // Fire the event from c-list
        this.dispatchEvent(event);
    }
}
