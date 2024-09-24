;; 4. Design a WebAssembly module where `br_table` is used in a function to branch to various local targets or an indirectly called function from an imported module. Verify the handling of stack operand types and consistency when switching control flows between modules.

(assert_invalid
  (module
    (import "env" "externalFunction" (func $externalFunction (result i32)))
    (func $branch (param i32) (result i32)
      (block $default (result i32)
        (block $l1 (result i32)
          (block $l2 (result i32)
            local.get 0
            br_table $l1 $l2 $default
          )
          (call $externalFunction)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)