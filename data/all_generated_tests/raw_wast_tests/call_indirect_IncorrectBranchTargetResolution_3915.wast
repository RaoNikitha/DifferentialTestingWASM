;; 4. Construct a WebAssembly module with a function table including diverse function types and an indirect call followed by conditional branches. Mismatch in signature handling results in `br_if` targeting an incorrect branch, bypassing an essential operation.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f32) (result f32)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func $foo (type 0) (param i32) (result i32) (local.get 0))
    (func $bar (type 1) (param f32) (result f32) (local.get 0))
    (func (block (br_if 0 (call_indirect (type 0) (i32.const 1) (i32.const 42)))))
  )
  "type mismatch"
)