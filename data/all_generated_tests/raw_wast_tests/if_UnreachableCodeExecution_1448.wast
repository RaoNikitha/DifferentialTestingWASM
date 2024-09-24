;; 9. Validate an if control flow wherein an `unreachable` instruction is reached via branching from a nested `block` structure in the case of conditionally evaluating control instructions.    ```    (module      (func (result i32)        (i32.const 1)        if (result i32)          (block (result i32)            (br 0)            unreachable          )          (i32.const 2)        else          (i32.const 3)        end      )    )    ```    Constraint: Block within if leading to unreachable trap.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      if (result i32)
        (block (result i32)
          (br 0)
          unreachable
        )
        (i32.const 2)
      else
        (i32.const 3)
      end
    )
  )
  "unreachable instruction reached via branching"
)