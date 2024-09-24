;; - Implement mutual recursion with two functions that call each other. Use the `call` instruction for mutual invocation and test if stack and type handling are consistent during recursive calls, especially under condition evaluations.

(assert_invalid
  (module
    (type (func))
    (type (func (param i32) (result i32)))
    (func $mutual1 (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.sub
      call $mutual2)
    (func $mutual2 (param i32) (result i32)
      local.get 0
      i32.eqz
      if (result i32)
        i32.const 0
      else
        local.get 0
        call $mutual1
      end)
  )
  "type mismatch"
)