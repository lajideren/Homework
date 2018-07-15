package service.impl;

import mapper.ClientMapper;
import org.springframework.beans.factory.annotation.Autowired;
import pobject.Client;
import service.ClientService;

public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientMapper clientMapper;

    @Override
    public boolean register(String username, String password, String email) {
        try {
            return clientMapper.register(username, password, email) == 1;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean login(String username, String password) {

        Client client=clientMapper.findClient(username);
        if(client==null){
            return false;
        }
        return password.equals(client.getPassword());

    }

    @Override
    public Client findClient(String username) {
        return clientMapper.findClient(username);
    }
}
