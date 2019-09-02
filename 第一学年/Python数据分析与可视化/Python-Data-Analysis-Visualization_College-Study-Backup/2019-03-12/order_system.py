import time
import json

class command:
    options={
        'help':{
            'command':'self.show_help()',
            'description':'\'help\' to get the option list.\n\'help [option name]\' to get option description'
        }
    }
    
    tip={
        'top':'--------Welcome to my command system--------',
        'help':'This command provides the following options:'
    }    

    default_command_list=['help']

    def __new__(self,command_list=[]):
        self=object().__new__(self)
        if not command_list:
            command_list=self.default_command_list
        self.__init__()
        self.__call__(command_list)

    def __call__(self,command_list):
        for item in command_list:
            if '__'+item in self.options:
                item='__'+item
            if  item in self.options:
                eval(self.options[item]['command'])
            else:
                print('\''+item+'\'','is not a legal parameter for','\''+self.__class__.__name__.replace('_',' ')+'\'\nTry:\t\'help '+self.__class__.__name__.replace('_',' '),'\'')


    @staticmethod
    def show_list(items):
        for item in items:
            if item[:2]!='__':
                print('',item,sep='\t')

    def show_help(self,command=[]):
        for item in command:
            if item[:2]!='__':
                print(self.options[item]['description'])
            else:
                print(item+' is not an option')
        if not command:
            print(self.tip['help'])
            self.show_list(list(self.options.keys()))

class command_line(command):
    tip={
        'top':'--------Welcome to my command line system--------',
        'help':'The system provides the following command:',
    }    

    def __init__(self):
        self.options=dict(self.options,**{
            'return':{
                'command':'0',
                'description':'return to last menu'
            },
            'exit':{
                'command':'exit(\'goodbye\')',
                'description':'exit current system'
            }
        })
        self.options['help']={
            'command':'self.show_help(command_list)',
            'description':'\'help\' to get the option list.\n\'help [option name]\' to get option description'
        }

    def __call__(self,command_list):
        print(self.tip['top'])
        self.command_line()

    def command_line(self):
        selected=''
        while selected!=0:
            selected=input('>>>')
            command_list=selected.split()
            if command_list:
                selected=command_list[0]
                del command_list[0]
            if selected in self.options.keys():
                selected=eval(self.options[selected]['command'])
            else:
                print(selected+' '+' '.join(command_list),'is not a legal option.\nTry:\t\'help\'.')

class command_line(command_line):
    product={
        'drink':{
            'juice':{
                'price':2,
                'description':'orange juice'
            }
        },
        'food':{
            'bread':{
                'price':3,
                'description':'black bread'
            }
        }
    }

class main_menu(command_line):
    tip={
        'top':'--------main menu--------',
        'help':'The main menu provides the following command:'
    }
    
    order_list=[]

    def __init__(self):
        command_line.__init__(self)
        self.options=dict({
            'order':{
                'command':'order(self),print(self.tip[\'top\'])',
                'description':'go to the order menu'
            },
            'report':{
                'command':'self.report(command_list)',
                'description':'report order list'
            }
        },**self.options)

    def report(main_menu,command_list):
        class report(command):
            default_command=['directory']
            tip={
                'help':'This command provides the following options:'
            }

            def terminal(self):
                print('\ttime\t\t\tcost\tproduct')
                for num in self.order_list:
                    print(time.asctime(time.localtime(num['time'])),'￥'+str(num['cost']),sep='\t',end='\t')
                    first_index=True
                    for item_index in num['order']:
                        if not first_index:
                            print(';',end='')
                            first_index=False
                        first_item=True
                        for item in num['order'][item_index]:
                            if first_item:
                                print(item_index+':',end='')
                                first_item=False
                                print(item+'*'+str(num['order'][item_index][item]))
                            

            def file(self):
                file_object=open('order_list.json','tw')
                order_json=json.dumps(self.order_list)
                file_object.write(order_json)
                file_object.close()


            def __init__(self):
                self.options=dict({
                    'terminal':{
                        'command':'self.terminal()',
                        'description':'report order list to terminal'
                    },
                    'file':{
                        'command':'self.file()',
                        'description':'report order list to file'
                    }
                },**self.options)
                self.order_list=main_menu.order_list
            
        report(command_list)

class order(command_line):
    tip={
        'top':'--------order menu--------',
        'help':'The order menu provides the following command:'
    }

    def __init__(self):
        command_line.__init__(self)
        self.options=dict({
            'show':{
                'command':'self.show(command_list)',
                'description':'show product info and cart'
            },
            'add':{
                'command':'self.add(command_list)',
                'description':'add product to cart'
            },
            'delete':{
                'command':'self.delete(command_list)',
                'description':'delete product to cart'
            },
            'checkout':{
                'command':'self.checkout()',
                'description':'check the cart and confirm'
            }
        },**self.options)

        for item_index in self.product:
            for item in self.product[item_index]:
                self.product[item_index][item]['num']=0

    def __call__(self,command_list):
        print(self.tip['top'])
        self.main_menu=command_list
        self.command_line()

    def checkout(self):
        self.show(['cart'])
        check_list={
            True:['y','Y','yes','Yes','YES','t','T','true','True','TRUE'],
            False:['n','N','no','No','NO','f','F','false','False','FALSE']
        }
        authorization=''
        while type(authorization)==type(''):
            authorization=input('please check your cart,are you sure to check out:')
            for item in check_list:
                if authorization in check_list[item]:
                    authorization=item
        if authorization:
            order={
                'time':time.time(),
                'cost':0,
                'order':{}
            }
            for item_index in self.product:
                first=True
                for item in self.product[item_index]:
                    if self.product[item_index][item]['num']>0:
                        if first:
                            order['order'][item_index]={}
                            first=False
                        order['order'][item_index][item]=self.product[item_index][item]['num']
                        order['cost']+=self.product[item_index][item]['num']*self.product[item_index][item]['price']
                        self.product[item_index][item]['num']=0
            self.main_menu.order_list.append(order)
            print('Your order has been submitted\nThank you')
            print(self.tip['top'])



    def show(order,command_list):
        class show(command):
            default_command_list=['directory']
            tip={
                'help':'This command provides the following options:\n\t[product name]'
            }

            def directory(self):
                print('----directory----')
                for item in order.product:
                    print('',item,sep='\t')
                print('Try:\t\'show [product type]\'')

            def all(self):
                print('----all product----')
                for item_type in order.product:
                    print('','----'+item_type+'----',sep='\t')
                    for item in order.product[item_type]:
                        print('\t',item,sep='\t')
                print('Try:\t\'show [product type]\'\n\t\'show [product]\'')
            
            def cart(self):
                total_price=0
                for item_index in order.product:
                    first=True
                    price=0
                    for item in order.product[item_index]:
                        if order.product[item_index][item]['num']>0:
                            if first:
                                print(item_index+':')
                                first=False
                            print('',item,'￥'+str(order.product[item_index][item]['price'])+'*'+str(order.product[item_index][item]['num']),'￥'+str(order.product[item_index][item]['price']*order.product[item_index][item]['num']),sep='\t')
                            price+=order.product[item_index][item]['price']*order.product[item_index][item]['num']
                    if not first:
                        print('','',item_index+':','￥'+str(price),sep='\t')
                        total_price+=price
                print('','','','total:','￥'+str(total_price),sep='\t')

            def product(self,product):
                for item in order.product:
                    if product in order.product[item]:
                        print('',product,'￥'+str(order.product[item][product]['price']),order.product[item][product]['description'],sep='\t')
                        break

            def __init__(self):
                self.options=dict({
                    'directory':{
                        'command':'self.directory()',
                        'description':'show product directory'
                    },
                    'all':{
                        'command':'self.all()',
                        'description':'show all product'
                    },
                    'cart':{
                        'command':'self.cart()',
                        'description':'show cart'
                    }
                },**self.options)

                for item_index in order.product:
                    for item in order.product[item_index]:
                        self.options=dict(self.options,**{
                            '__'+item:{
                                'command':'self.product(\''+item+'\')',
                                'description':order.product[item_index][item]['description']
                            }
                        })
                        
        show(command_list)

    def add(order,command_list):
        class add(command):
            tip={
                'help':'This command provides the following options:\n\t[product name]'
            }

            def product(self,product):
                for item in order.product:
                    if product in order.product[item]:
                        order.product[item][product]['num']+=1
                        print('add one',product,'to the cart')
                        break

            def __init__(self):
                for item_index in order.product:
                    for item in order.product[item_index]:
                        self.options=dict(self.options,**{
                            '__'+item:{
                                'command':'self.product(\''+item+'\')',
                                'description':order.product[item_index][item]['description']
                            }
                        })
                        
        add(command_list)

    def delete(order,command_list):
        class delete(command):
            #default_command=['help']#care
            tip={
                'help':'This command provides the following options:\n\t[product name]'
            }

            def product(self,product):
                for item in order.product:
                    if product in order.product[item]:
                        if order.product[item][product]['num']>0:
                            order.product[item][product]['num']-=1
                            print('delete one',product,'from the cart')
                        else:
                            print('failed to delete',product+',don\'t have any in the cart')
                        break

            def __init__(self):
                for item_index in order.product:
                    for item in order.product[item_index]:
                        self.options=dict(self.options,**{
                            '__'+item:{
                                'command':'self.product(\''+item+'\')',
                                'description':order.product[item_index][item]['description']
                            }
                        })
                        
        delete(command_list)

print('--------Welcome to the order system--------')
main_menu()