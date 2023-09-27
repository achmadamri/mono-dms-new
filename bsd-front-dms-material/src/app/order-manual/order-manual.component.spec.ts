import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OrderManualComponent } from './order-manual.component';

describe('OrderManualComponent', () => {
  let component: OrderManualComponent;
  let fixture: ComponentFixture<OrderManualComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OrderManualComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OrderManualComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
