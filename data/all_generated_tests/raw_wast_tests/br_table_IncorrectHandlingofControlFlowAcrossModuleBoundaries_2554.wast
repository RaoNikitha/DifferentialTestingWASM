;; **Test 3: Exported function from nested block with br_table leading to default label** - Module A has deeply nested blocks ending with `br_table` specifying an out-of-bounds jump to the default label. - Module B imports and calls this function. Test observes if `wizard_engine` properly defaults to the specified label and halts on arity mismatch, unlike WebAssembly.

(assert_invalid
  (module
    (func $nested-blocks (export "nestedBlocks")
      (block
        (block
          (block
            (block
              (br_table 0 1 (i32.const 5))
            )
          )
        )
      )
    )
    (func (import "env" "nestedBlocks"))
  )
  "unknown label"
)