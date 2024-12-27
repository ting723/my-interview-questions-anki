# Spring

## Spring MVC

<!-- notecardId: 1735193810994 -->

### Spring MVC 流程

1. **客户端请求**：客户端发送请求到服务器。
2. **DispatcherServlet 接收请求**：Spring MVC 的前端控制器 `DispatcherServlet` 接收请求。
3. **HandlerMapping 查找处理器**：`DispatcherServlet` 调用 `HandlerMapping`，根据请求 URL 查找对应的处理器（Controller）。
4. **HandlerAdapter 调用处理器**：`DispatcherServlet` 调用 `HandlerAdapter`，适配并执行找到的处理器。
5. **处理器处理请求**：处理器（Controller）执行具体的业务逻辑，并返回一个 `ModelAndView` 对象。
6. **ViewResolver 解析视图**：`DispatcherServlet` 调用 `ViewResolver`，根据 `ModelAndView` 中的视图名解析到具体的视图。
7. **渲染视图**：视图负责渲染，将模型数据填充到视图中，生成最终的 HTML 响应。
8. **返回响应**：`DispatcherServlet` 将生成的响应返回给客户端。

### DispatcherServlet 核心实现

`DispatcherServlet` 是 Spring MVC 的核心组件，负责请求的分发和处理。其核心实现包括以下几个步骤：

1. **初始化**：在 Spring 容器启动时，`DispatcherServlet` 会初始化，并加载配置文件中定义的 `HandlerMapping`、`HandlerAdapter`、`ViewResolver` 等组件。
2. **请求分发**：接收到请求后，`DispatcherServlet` 会根据请求 URL 调用相应的 `HandlerMapping` 查找处理器。
3. **处理请求**：找到处理器后，`DispatcherServlet` 会通过 `HandlerAdapter` 调用处理器的方法，处理请求并返回 `ModelAndView`。
4. **视图解析**：根据 `ModelAndView` 中的视图名，`DispatcherServlet` 调用 `ViewResolver` 解析视图。
5. **视图渲染**：最终，`DispatcherServlet` 将模型数据填充到视图中，渲染生成响应，并返回给客户端。

通过以上步骤，`DispatcherServlet` 实现了请求的分发和处理，完成了整个 Spring MVC 的请求处理流程。
