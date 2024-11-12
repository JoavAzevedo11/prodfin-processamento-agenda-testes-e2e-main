from cpf_generator import CPF
from robot.api.deco import keyword

class   generate_cpf():

    @keyword("gerar cpf valido")
    def gerar_cpf(self):
        return  CPF.generate()