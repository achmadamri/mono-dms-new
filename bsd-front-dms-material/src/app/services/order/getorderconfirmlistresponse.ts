import { ViewOrderConfirm } from './vieworderconfirm';

export class GetOrderConfirmListResponse {
    requestId: string;
    requestDate: string;
    responseId: string;
    responseDate: string;
    status: string;
    error: string;
    message: string;
    lstViewOrderConfirm: ViewOrderConfirm[] = Array(new ViewOrderConfirm());
    length: number;
}
