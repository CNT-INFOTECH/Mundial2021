import { Component, Input } from '@angularcore';
import { NgbActiveModal, NgbModal } from '@ng-bootstrapng-bootstrap';

@Component({
  selector 'ngbd-modal-content',
  template `
    div class=modal-header
      h4 class=modal-titleHi there!h4
      button type=button class=close aria-label=Close (click)=activeModal.dismiss('Cross click')
        span aria-hidden=true&times;span
      button
    div
    div class=modal-body
      pHello, {{name}}!p
    div
    div class=modal-footer
      button type=button class=btn btn-outline-dark (click)=activeModal.close('Close click')Closebutton
    div
  `
})
export class NgbdModalContent {
  @Input() name;

  constructor(public activeModal NgbActiveModal) {}
}

@Component({
  selector 'ngbd-modal-component',
  templateUrl '.modal-component.html'
})
export class NgbdModalComponent {
  constructor(private modalService NgbModal) {}

  open() {
    const modalRef = this.modalService.open(NgbdModalContent);
    modalRef.componentInstance.name = 'World';
  }
}