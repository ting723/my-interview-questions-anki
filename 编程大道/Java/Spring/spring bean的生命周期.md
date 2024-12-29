# Spring

## Spring Bean 的生命周期

<!-- notecardId: 1735193656350 -->

Spring Bean 的生命周期包括以下几个阶段：

1. **实例化（Instantiation）**：

   - Spring 容器通过反射机制创建 Bean 的实例。

2. **属性赋值（Populate Properties）**：

   - Spring 容器将 Bean 的属性进行依赖注入。

3. **初始化（Initialization）**：

   - 如果 Bean 实现了`BeanNameAware`接口，Spring 将 Bean 的 ID 传递给`setBeanName`方法。
   - 如果 Bean 实现了`BeanFactoryAware`接口，Spring 将调用`setBeanFactory`方法，将`BeanFactory`实例传递给 Bean。
   - 如果 Bean 实现了`ApplicationContextAware`接口，Spring 将调用`setApplicationContext`方法，将`ApplicationContext`实例传递给 Bean。
   - 如果 Bean 实现了`InitializingBean`接口，Spring 将调用`afterPropertiesSet`方法。
   - 如果 Bean 在配置文件中通过`<bean>`元素的`init-method`属性指定了初始化方法，Spring 将调用该方法。

4. **使用（Usage）**：

   - Bean 已经准备好被使用，此时可以进行业务逻辑操作。

5. **销毁（Destruction）**：
   - 如果 Bean 实现了`DisposableBean`接口，Spring 将调用`destroy`方法。
   - 如果 Bean 在配置文件中通过`<bean>`元素的`destroy-method`属性指定了销毁方法，Spring 将调用该方法。

> 通过这些阶段，Spring 容器能够管理 Bean 的整个生命周期，从创建到销毁。

### Bean 生命周期

> 指定的就是 Bean 从创建到销毁的整个过程：

1. 实例化
   - 通过反射去推断构造函数进行实例化
   - 实例工厂、静态工厂
2. 属性赋值
   - 解析自动装配（ByName、ByType、Constractor、none、@Autowired）DI 的体现
   - 循环依赖
3. 初始化
   - 调用 xXXAware 回调方法
   - 调用初始化生命周期回调(三种）
   - 如果 bean 实现 aop 创建动态代理
4. 销毁
   - 在 spring 容器关闭的时候进行调用
   - 调用销毁生命周期回调
