;; 10. Design a module with nested constructs that use both direct and indirect function calls. Place `call_indirect` inside inner scopes and mix direct calls outside. Confirm that the nesting of calls does not interfere with the type and depth context resolution.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32) (result i32)))
    (import "env" "func1" (func $func1 (type 0)))
    (table funcref (elem $func1))
    (func $nested
      (block
        (loop
          (if (i32.const 1)
            (then
              (call_indirect (type 0) (i32.const 0))
              (call $func1 (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)