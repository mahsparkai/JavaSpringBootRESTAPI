package com.example.CRUD.user;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
class UserService {
    private final UserRepository userRepository;
    UserService(UserRepository userRepository){
        this.userRepository = userRepository;
    }
    public List<User> getAllUsers(){
        return userRepository.findAll();
    }
    public User getUserById(Long id){
        return userRepository.findById(id)
                .orElseThrow(()-> new UserNotFoundException("No user found with id: "+id));
    }
    public User createUser(User user){
        return userRepository.save(user);
    }

    public void updateUser(Long id, User updatedUser){
        User user = userRepository.findById(id)
                .orElseThrow(()-> new UserNotFoundException("No user found with id: "+id));
        user.setFirst_name(updatedUser.getFirst_name());
        user.setLast_name(updatedUser.getLast_name());
        user.setEmail(updatedUser.getEmail());
        user.setPhone_number(updatedUser.getPhone_number());
        user.setSkype(updatedUser.getSkype());
        user.setLinkedin(updatedUser.getLinkedin());
        user.setInstagram(updatedUser.getInstagram());
    }

    public void deleteUser(Long id){
        userRepository.deleteById(id);
    }

}
