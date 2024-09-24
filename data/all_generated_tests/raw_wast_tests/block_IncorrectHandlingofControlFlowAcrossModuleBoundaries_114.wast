;; Create a block containing a `br_table` that branches to multiple cases, where one case involves calling an exported function from another module. Ensure that the stack state before and after each branch case is consistent with the expected types specified by the block.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test
      (block (result i32)
        (br_table 0 0 0 (i32.const 0))
      )
    )
    (export "test" (func $test))
  )
  "type mismatch"
)