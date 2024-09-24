;; 1. **Test 1**: Construct a `br_table` that includes a label vector of size 5 and a default label. Push a value onto the stack that is within range but check for a matching operand type, emphasizing `wizard_engine`'s early exit condition since `WebAssembly` may process differently.

(assert_invalid
  (module (func $test_br_table_operand_type_matching
    (block $default (result i32)
      (block $l1 (result i32) (block $l2 (br_table $l1 $l1 $l2 $default $l1 $default (i32.const 2))))
      (i64.const 0)
    )
  ))
  "type mismatch"
)