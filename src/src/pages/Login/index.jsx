import { useEffect, useState } from "react";
import Form from "@/components/Form";

export default function Login() {
    const [showError, setShowError] = useState({
        email: false,
        password: false
    })

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    useEffect(() => {
        setShowError(previousValue => ({ ...previousValue, emailError: false }));
    }, [email]);

    useEffect(() => {
        setShowError(previousValue => ({ ...previousValue, passwordError: false }));
    }, [password]);

    const handleError = () => {
        setShowError({
            emailError: false,
            passwordError: false
        })
        if (!email) {
            setShowError(previousValue => ({ ...previousValue, emailError: true }));
        }

        if (!password) {
            setShowError(previousValue => ({ ...previousValue, passwordError: true }));
        }
    }

    const handleChange = (value) => {
       
        handleError();
    }

    const handleSubmit = (event) => {
        event.preventDefault();
        handleError();
    }

    return (
        <Form onSubmit={handleSubmit} className="m-auto w-25 mt-5">
            <div className="mb-3">
                <label htmlFor="" className="form-label">Email</label>
                <input type="email"
                    className="form-control"
                    value={email}
                    onBlur={() => handleError()}
                    onChange={event => handleChange(setEmail(event.target.value))}
                />
                <div className={showError.emailError ? 'invalid-feedback d-block' : 'invalid-feedback'}>
                    Campo obrigatório!
                </div>
            </div>
            <div className="mb-3">
                <label htmlFor="" className="form-label">Senha</label>
                <input type="password"
                    className="form-control"
                    value={password}
                    onBlur={() => handleError()}
                    onChange={event => handleChange(setPassword(event.target.value))}
                />
                <div className={showError.passwordError ? 'invalid-feedback d-block' : 'invalid-feedback'}>
                    Campo obrigatório!
                </div>
            </div>
            <div className="mb-3">
                <button className="btn btn-primary w-100">Entrar</button>
            </div>
        </Form>
    );
}
