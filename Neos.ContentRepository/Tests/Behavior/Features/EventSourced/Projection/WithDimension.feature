@fixtures
Feature: Reading of our Graph Projection

  Background:
    Given I have the following content dimensions:
      | Identifier | Default | Presets                                     |
      | language   | mul     | mul=mul; de=de,mul; en=en,mul; ch=ch,de,mul |


  Scenario: Property Changes with two dimensions
    Given the Event "Neos.ContentRepository:RootNodeWasCreated" was published to stream "Neos.ContentRepository:ContentStream:c75ae6a2-7254-4d42-a31b-a629e264069d" with payload:
      | Key                      | Value                                |
      | contentStreamIdentifier  | c75ae6a2-7254-4d42-a31b-a629e264069d |
      | nodeIdentifier           | 5387cb08-2aaf-44dc-a8a1-483497aa0a03 |
      | initiatingUserIdentifier | 00000000-0000-0000-0000-000000000000 |

    And the Event "Neos.ContentRepository:NodeAggregateWithNodeWasCreated" was published to stream "Neos.ContentRepository:ContentStream:c75ae6a2-7254-4d42-a31b-a629e264069d" with payload:
      | Key                           | Value                                                                                | Type                   |
      | contentStreamIdentifier       | c75ae6a2-7254-4d42-a31b-a629e264069d                                                 |                        |
      | nodeAggregateIdentifier       | 35411439-94d1-4bd4-8fac-0646856c6a1f                                                 |                        |
      | nodeTypeName                  | Neos.ContentRepository.Testing:NodeWithoutAutoCreatedChildNodes                      |                        |
      | dimensionSpacePoint           | {"coordinates": {"language": "de"}}                                                  | json                   |
      | visibleDimensionSpacePoints   | {"points":[{"coordinates":{"language": "de"}}, {"coordinates":{"language": "mul"}}]} | DimensionSpacePointSet |
      | nodeIdentifier                | 75106e9a-7dfb-4b48-8b7a-3c4ab2546b81                                                 |                        |
      | parentNodeIdentifier          | 5387cb08-2aaf-44dc-a8a1-483497aa0a03                                                 |                        |
      | nodeName                      | foo                                                                                  |                        |
      | propertyDefaultValuesAndTypes | {}                                                                                   | json                   |


    And the Event "Neos.ContentRepository:NodePropertyWasSet" was published to stream "Neos.ContentRepository:ContentStream:c75ae6a2-7254-4d42-a31b-a629e264069d" with payload:
      | Key                     | Value                                         | Type          |
      | contentStreamIdentifier | c75ae6a2-7254-4d42-a31b-a629e264069d          |               |
      | nodeIdentifier          | 75106e9a-7dfb-4b48-8b7a-3c4ab2546b81          |               |
      | propertyName            | test                                          |               |
      | value                   | {"value": "original value", "type": "string"} | PropertyValue |

    When the graph projection is fully up to date

    And I am in content stream "c75ae6a2-7254-4d42-a31b-a629e264069d" and Dimension Space Point {"coordinates":{"language": "mul"}}

    Then I expect a node "75106e9a-7dfb-4b48-8b7a-3c4ab2546b81" to exist in the graph projection

    #
    And I expect the node "5387cb08-2aaf-44dc-a8a1-483497aa0a03" to have the following child nodes:
      | Name | NodeIdentifier                       |
      | foo  | 75106e9a-7dfb-4b48-8b7a-3c4ab2546b81 |