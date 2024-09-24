;; Create a nested `block` environment with multiple `blocks` inside a function, and have a `br` instruction target the wrong `block` level. Insert an `unreachable` instruction right after the target resolution step to ensure traps are handled correctly across implementations.

(assert_invalid
  (module (func $nested-block-br-unreachable
    (block (block (block (br 3) (unreachable) ))))
  )
  "unknown label"
)