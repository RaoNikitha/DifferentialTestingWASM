;; 4. **Misplaced End Marker Causing Unreachable to be Reached**:    - Have a block with misplaced `end` markers wherein a branch instruction misinterprets the end of one block, thus continuing to the next block containing an `unreachable` instruction. This will pinpoint differences in manual context management.

(assert_invalid
  (module (func $misplaced-end-marker (result i32)
    (block (result i32)
      (block (result i32)
        (br 1 (i32.const 1))
      )
      end
      unreachable
    )
    end
  ))
  "type mismatch"
)