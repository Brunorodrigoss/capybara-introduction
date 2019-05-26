describe 'Forms' do
    it 'login com sucesso' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'
        
        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'

        expect(find('#flash').visible?).to be true
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
        
    end

    it 'login com senha incorreta' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'
        
        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'wrongpass'

        click_button 'Login'
        expect(find('#flash')).to have_content 'Senha é invalida!'
    end

    it 'usuario nao cadastrado' do
        visit 'https://training-wheels-protocol.herokuapp.com/login'
        
        fill_in 'userId', with: 'lanister'
        fill_in 'password', with: 'wrongpass'

        click_button 'Login'
        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
    end
end