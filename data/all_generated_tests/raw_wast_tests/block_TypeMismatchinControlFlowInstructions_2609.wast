;; Test 10: Configure a block with instructions that require more operands than those indicated by the `blocktype`. For example, if the blocktype expects no inputs but the block instructions require `i32` inputs. This checks if the stack state is validated both before entering the block and unwinding due to branches.

(assert_invalid
  (module (func $block-invalid-operands
    (block (result i32)
      (i32.add (i32.const 1) (nop))
    )
  ))
  "type mismatch"
)