import { ViewBrandProduct } from './viewbrandproduct';
import { ViewProductMarket } from './viewproductmarket';

export class GetProductMarketListResponse {
    requestId: string;
    requestDate: string;
    responseId: string;
    responseDate: string;
    status: string;
    error: string;
    message: string;
    lstViewProductMarket: ViewProductMarket[] = Array(new ViewProductMarket());
    length: number;
}
