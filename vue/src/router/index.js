import { createRouter, createWebHistory } from 'vue-router'
import Layout from '../layout/Layout.vue'
import UserLayout from "@/layout/UserLayout";

/**
 *  路由配置-页面跳转
 * @type {[{redirect: string, path: string, component: {components: {Aside: {data(): {path: *}, created(): void, name: string}, Header: {data(): {loginName: string}, created(): void, methods: {logout(): void, getLoginName(): void}, name: string, props: [string]}}, name: string}, children: [{path: string, component: (function(): Promise<{readonly default?: {components: {}, data(): {total: number, userImg: *, form: {}, dialogVisible: boolean, pageSize4: number, name: string, tableData: [], currentPage4: number}, created(): void, methods: {add(): void, load(): void, pageSize4(), handleSizeChange(*): void, save(): void, update(): void, handleEdit(*): void, handleAvatarSuccess(*): void, checkLogin(): void, handleCurrentChange(*): void, handleDelete(*): void}, name: string}}>), name: string},{path: string, component: (function(): Promise<{readonly default?: {components: {}, data(): {search: string, total: number, form: {}, dialogVisible: boolean, pageSize4: number, tableData: [], currentPage4: number}, created(): void, methods: {add(): void, load(): void, pageSize4(), handleSizeChange(*): void, save(): void, update(): void, handleEdit(*): void, handleAvatarSuccess(*): void, checkLogin(): void, handleCurrentChange(*): void, handleDelete(*): void}, name: string}}>), name: string},{path: string, component: (function(): Promise<{readonly default?: {components: {}, data(): {total: number, userImg: *, form: {}, dialogVisible: boolean, pageSize4: number, name: string, tableData: [], currentPage4: number}, created(): void, methods: {add(): void, load(): void, pageSize4(), handleSizeChange(*): void, save(): void, update(): void, handleEdit(*): void, handleAvatarSuccess(*): void, checkLogin(): void, handleCurrentChange(*): void, handleDelete(*): void}, name: string}}>), name: string},{path: string, component: (function(): Promise<{readonly default?: {data(): {form: {}, imageUrl: string}, created(): void, methods: {update(): void, handleAvatarSuccess(*): void, checkLogin(): void}, name: string}}>), name: string},{path: string, component: (function(): Promise<{readonly default?: {components: {}, data(): {search: string, total: number, form: {}, dialogVisible: boolean, pageSize4: number, tableData: [], currentPage4: number}, created(): void, methods: {add(): void, load(): void, pageSize4(), handleSizeChange(*): void, save(): void, update(): void, handleEdit(*): void, handleAvatarSuccess(*): void, checkLogin(): void, handleCurrentChange(*): void, handleDelete(*): void}, name: string}}>), name: string},null,null,null,null,null], name: string},{path: string, component: (function(): Promise<{readonly default?: {data(): {form: {}, rules: {password: [{trigger: string, message: string, required: boolean}], name: [{trigger: string, message: string, required: boolean}]}}, methods: {login(): void}, name: string}}>), name: string},{path: string, component: (function(): Promise<{readonly default?: {components: {UserFilled: ComponentPublicInstanceConstructor<{$: ComponentInternalInstance, $data: UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "D"> & EnsureNonVoid<{}>, $props: Partial<UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "Defaults"> & EnsureNonVoid<{}>> & Omit<UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "P"> & EnsureNonVoid<Readonly<ExtractPropTypes<{}>>> & VNodeProps & AllowedComponentProps & ComponentCustomProps & Readonly<ExtractPropTypes<{}>>, keyof UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "Defaults"> & EnsureNonVoid<{}>>, $attrs: Data, $refs: Data, $slots: Slots, $root: ComponentPublicInstance | null, $parent: ComponentPublicInstance | null, $emit: EmitFn<ObjectEmitsOptions | string[]>, $el: any, $options: ComponentOptionsBase<Readonly<ExtractPropTypes<{}>>, {}, {}, {}, {}, ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>, ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>, ObjectEmitsOptions | string[], string, {}> & MergedComponentOptionsOverride, $forceUpdate: () => void, $nextTick: typeof nextTick, $watch(source: (string | Function), cb: Function, options?: WatchOptions): WatchStopHandle} & UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "P"> & EnsureNonVoid<Readonly<ExtractPropTypes<{}>>> & ShallowUnwrapRef<UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "B"> & EnsureNonVoid<{}>> & UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "D"> & EnsureNonVoid<{}> & ExtractComputedReturns<UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "C"> & EnsureNonVoid<{}>> & UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "M"> & ComponentCustomProperties & Readonly<ExtractPropTypes<{}>>> & ComponentOptionsBase<Readonly<ExtractPropTypes<{}>>, {}, {}, {}, {}, ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>, ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>, ObjectEmitsOptions | string[], string, {}> & VNodeProps & AllowedComponentProps & ComponentCustomProps}, data(): {form: {}, background: {backgroundColor: string, backgroundImage: string, backgroundSize: string, backgroundPosition: string, backgroundRepeat: string}, rules: {password: [{trigger: string, message: string, required: boolean}], name: [{trigger: string, message: string, required: boolean}]}}, methods: {login(): void}, name: string}}>), name: string},{path: string, component: (function(): Promise<{readonly default?: {components: {UserFilled: ComponentPublicInstanceConstructor<{$: ComponentInternalInstance, $data: UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "D"> & EnsureNonVoid<{}>, $props: Partial<UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "Defaults"> & EnsureNonVoid<{}>> & Omit<UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "P"> & EnsureNonVoid<Readonly<ExtractPropTypes<{}>>> & VNodeProps & AllowedComponentProps & ComponentCustomProps & Readonly<ExtractPropTypes<{}>>, keyof UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "Defaults"> & EnsureNonVoid<{}>>, $attrs: Data, $refs: Data, $slots: Slots, $root: ComponentPublicInstance | null, $parent: ComponentPublicInstance | null, $emit: EmitFn<ObjectEmitsOptions | string[]>, $el: any, $options: ComponentOptionsBase<Readonly<ExtractPropTypes<{}>>, {}, {}, {}, {}, ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>, ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>, ObjectEmitsOptions | string[], string, {}> & MergedComponentOptionsOverride, $forceUpdate: () => void, $nextTick: typeof nextTick, $watch(source: (string | Function), cb: Function, options?: WatchOptions): WatchStopHandle} & UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "P"> & EnsureNonVoid<Readonly<ExtractPropTypes<{}>>> & ShallowUnwrapRef<UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "B"> & EnsureNonVoid<{}>> & UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "D"> & EnsureNonVoid<{}> & ExtractComputedReturns<UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "C"> & EnsureNonVoid<{}>> & UnwrapMixinsType<IntersectionMixin<ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>>, "M"> & ComponentCustomProperties & Readonly<ExtractPropTypes<{}>>> & ComponentOptionsBase<Readonly<ExtractPropTypes<{}>>, {}, {}, {}, {}, ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>, ComponentOptionsBase<any, any, any, any, any, any, any, any, any, any>, ObjectEmitsOptions | string[], string, {}> & VNodeProps & AllowedComponentProps & ComponentCustomProps}, data(): {form: {}, background: {backgroundColor: string, backgroundImage: string, backgroundSize: string, backgroundPosition: string, backgroundRepeat: string}, rules: {code: [{trigger: string, message: string, required: boolean}], phone: [{trigger: string, message: string, required: boolean}]}}, methods: {loginByCode(): void, sendMsg(): void}, name: string}}>), name: string},{path: string, component: (function(): Promise<{readonly default?: {data(): {form: {}, rules: {confirm: [{trigger: string, message: string, required: boolean}], password: [{trigger: string, message: string, required: boolean}], phone: [{trigger: string, message: string, required: boolean}], name: [{trigger: string, message: string, required: boolean}], email: [{trigger: string, message: string, required: boolean}]}}, methods: {register(): void}, name: string}}>), name: string},null,null]}
 */

const routes = [
  {
    path: '/man',
    name: 'Layout',
    component: Layout,
    redirect:"/man/user",
    children:[{
      path: '/man/user',
      name: 'User',
      component: () => import("@/views/UserMan")
    }, {
      path: '/man/brandman',
      name: 'BrandMan',
      component: () => import("@/views/PetKindGuanli")
    }, {
      path: '/man/PetHealthGuanli',
      name: 'PetHealthGuanli',
      component: () => import("@/views/PetHealthGuanli")
    }, {
      path: '/man/person',
      name: 'Person',
      component: () => import("@/views/Person")
    }, {
      path: '/man/PetKindGuanli',
      name: 'PetKindGuanli',
      component: () => import("@/views/PetKindGuanli")
    }, {
      path: '/man/PetUnitGuanli',
      name: 'PetUnitGuanli',
      component: () => import("@/views/PetUnitGuanli")
    }, {
      path: '/man/PetAdoptionGuanli',
      name: 'PetAdoptionGuanli',
      component: () => import("@/views/PetAdoptionGuanli")
    }, {
      path: '/man/PetGoodsGuanli',
      name: 'PetGoodsGuanli',
      component: () => import("@/views/PetGoodsGuanli")
    }, {
      path: '/man/PetBlogGuanli',
      name: 'PetBlogGuanli',
      component: () => import("@/views/PetBlogGuanli")
    }, {
      path: '/man/PetOrdersGuanli',
      name: 'PetOrdersGuanli',
      component: () => import("@/views/PetOrdersGuanli")
    }
    ]
  }, {
    path: '/man/login',
    name: 'Login',
    component: () => import("@/views/Login")
  }, {
    path: '/userlogin',
    name: 'UserLogin',
    component: () => import("@/views/UserLogin")
  }, {
    path: '/userloginphone',
    name: 'UserLoginPhone',
    component: () => import("@/views/UserLoginPhone")
  }, {
    path: '/register',
    name: 'Register',
    component: () => import("@/views/Register")
  }, {
    path: '/userregister',
    name: 'UserRegister',
    component: () => import("@/views/UserRegister")
  }, {
    path: '/',
    name: 'UserLayout',
    component: UserLayout,
    redirect:"/index",
    children: [{
      path: 'index',
      name: 'Index',
      component: () => import("@/views/Index")
    },{
      path: '/adoption',
      name: 'Adoption',
      component: () => import("@/views/Adoption")
    },{
      path: '/adoptionpet',
      name: 'AdoptionPet',
      component: () => import("@/views/AdoptionPet")
    }, {
      path: '/blog',
      name: 'Blog',
      component: () => import("@/views/Blog")
    }, {
      path: '/blogdetail',
      name: 'BlogDetail',
      component: () => import("@/views/BlogDetail")
    }, {
      path: '/buypet',
      name: 'Buypet',
      component: () => import("@/views/Buypet")
    }, {
      path: '/petbaike',
      name: 'Petbaike',
      component: () => import("@/views/Petbaike")
    }, {
      path: '/PetSearch',
      name: 'PetSearch',
      component: () => import("@/views/PetSearch")
    }, {
      path: '/userperson',
      name: 'UserPerson',
      component: () => import("@/views/UserPerson")
    }, {
      path: '/PetPurchase',
      name: 'PetPurchase',
      component: () => import("@/views/PetPurchase")
    }, {
      path: '/GoodsPurchase',
      name: 'GoodsPurchase',
      component: () => import("@/views/GoodsPurchase")
    }, {
      path: '/HealthPurchase',
      name: 'HealthPurchase',
      component: () => import("@/views/HealthPurchase")
    },
    ]
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
