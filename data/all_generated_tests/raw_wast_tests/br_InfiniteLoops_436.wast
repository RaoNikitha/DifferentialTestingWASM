;; 7. **Test Description:** Introduce a forward `br` instruction in a loop body targeting the `end` of a `block`, requiring correct management of operand stack and validation to ensure the loop exits appropriately without causing an infinitely running block.

(assert_invalid
  (module
    (func $forward-br-in-loop
      (loop (block
        (br 1)
      ))
    )
  )
  "type mismatch"
)