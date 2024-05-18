
import Form from "@/components/Form";

export default function Login() {
    return (
    <Form className="m-auto w-25 mt-5">
        <div className="mb-3">
            <label htmlFor="" className="form-label">Email</label>
            <input type="text" className="form-control"/>
        </div>
        <div className="mb-3">
            <label htmlFor="" className="form-label">Senha</label>
            <input type="password" className="form-control"/>
        </div>
        <div className="mb-3">
            <button className="btn btn-primary w-100">Entrar</button>
        </div>
    </Form>
    );
}