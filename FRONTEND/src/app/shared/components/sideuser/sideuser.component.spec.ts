import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SideuserComponent } from './sideuser.component';

describe('SideuserComponent', () => {
  let component: SideuserComponent;
  let fixture: ComponentFixture<SideuserComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SideuserComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SideuserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
