;; 8. Design a scenario with a combination of nested `loop` and `block` instructions where labels are referenced comparatively from different depths. Issue a `br` instruction in this context and ensure that no misinterpretation of the target label index leads to incorrect operand stack behavior or control flow errors.

(assert_invalid
  (module (func
    (block
      (loop
        (block
          (br 2)
        )
      )
    )
  ))
  "label index out of bounds"
)