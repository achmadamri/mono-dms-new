import { ViewOrderConfirm } from './vieworderconfirm';

export class GetOrderConfirmSumResponse {
    requestId: string;
    requestDate: string;
    responseId: string;
    responseDate: string;
    status: string;
    error: string;
    message: string;
    sumAll: number;
    sumPacked: number;
    sumAdditionalPacked: number;
    sumNotPacked: number;
    sumDelivered : number;
    sumNotConfirmed : number;
}
